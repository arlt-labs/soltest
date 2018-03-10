function postData(url, data) {
    // Default options are marked with *
    return fetch(url, {
        body: JSON.stringify(data), // must match 'Content-Type' header
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, same-origin, *omit
        headers: {
            'user-agent': 'Mozilla/4.0 MDN Example',
            'content-type': 'application/json'
        },
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, cors, *same-origin
        redirect: 'follow', // *manual, follow, error
        referrer: 'no-referrer', // *client, no-referrer
    })
        .then(response => response.json()) // parses response to JSON
}

function receiveMessage(event) {
    console.log('receiveMessage', event.data, event.source, event.origin)
    document.getElementById('compilationdata').innerHTML += event.data + '<br>'
    console.log(window.location)
    document.getElementById('editor')

    postData('http://localhost:8081/setCompilationData', {"data": event.data})
        .then(data => console.log(data)).catch(error => console.error(error))

}

window.addEventListener('message', receiveMessage, false)

window.onload = function () {
    document.querySelector('input#testmessageadd').addEventListener('click', function () {
        window.parent.postMessage(JSON.stringify({
            type: 'setConfig',
            arguments: [document.getElementById('filename').value, document.getElementById('valuetosend').value],
            id: 34
        }), 'http://127.0.0.1:8080')
    })

    document.querySelector('input#testmessageremove').addEventListener('click', function () {
        window.parent.postMessage(JSON.stringify({
            type: 'removeConfig',
            arguments: [document.getElementById('filename').value],
            id: 35
        }), 'http://127.0.0.1:8080')
    })

    document.querySelector('input#testmessagerget').addEventListener('click', function () {
        window.parent.postMessage(JSON.stringify({
            type: 'getConfig',
            arguments: [document.getElementById('filename').value],
            id: 36
        }), 'http://127.0.0.1:8080')
    })
}

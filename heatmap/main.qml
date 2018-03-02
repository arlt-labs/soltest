import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Heatmap")

    ScrollView {
        id: view
        anchors.fill: parent
        TextEdit {
            color: "white"
            font.family: "Menlo"
            font.pointSize: 20
            width: parent.width
            text: "\
pragma solidity ^0.4.0;

contract SimpleAssignment {
    uint16 d;
    address owner;
    function SimpleAssignment(uint16 a) public {
        owner = msg.sender;
        d = a;
    }
    function add(uint16 a, uint16 b) public returns (uint16 sum)  {
        if (msg.sender == owner) {
            return a + b + d;
        } else {
            return a + b;
        }
    }
}
"
        }
    }
}

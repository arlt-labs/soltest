contract c {
	struct Data { uint x; uint y; }
	Data[2**10] data;
	uint[2**10 + 3] ids;
	function setIDStatic(uint id) { ids[2] = id; }
	function setID(uint index, uint id) { ids[index] = id; }
	function setData(uint index, uint x, uint y) { data[index].x = x; data[index].y = y; }
	function getID(uint index) returns (uint) { return ids[index]; }
	function getData(uint index) returns (uint x, uint y) { x = data[index].x; y = data[index].y; }
	function getLengths() returns (uint l1, uint l2) { l1 = data.length; l2 = ids.length; }
}


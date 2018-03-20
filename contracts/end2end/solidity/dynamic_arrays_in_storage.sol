contract c {
	struct Data { uint x; uint y; }
	Data[] data;
	uint[] ids;
	function setIDStatic(uint id) { ids[2] = id; }
	function setID(uint index, uint id) { ids[index] = id; }
	function setData(uint index, uint x, uint y) { data[index].x = x; data[index].y = y; }
	function getID(uint index) returns (uint) { return ids[index]; }
	function getData(uint index) returns (uint x, uint y) { x = data[index].x; y = data[index].y; }
	function getLengths() returns (uint l1, uint l2) { l1 = data.length; l2 = ids.length; }
	function setLengths(uint l1, uint l2) { data.length = l1; ids.length = l2; }
}


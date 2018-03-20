contract test {
	struct topStruct {
		nestedStruct nstr;
		emptyStruct empty;
		uint topValue;
		mapping (uint => uint) topMapping;
	}
	uint toDelete;
	topStruct str;
	struct nestedStruct {
		uint nestedValue;
		mapping (uint => bool) nestedMapping;
	}
	struct emptyStruct{
	}
	function test(){
		toDelete = 5;
		str.topValue = 1;
		str.topMapping[0] = 1;
		str.topMapping[1] = 2;

		str.nstr.nestedValue = 2;
		str.nstr.nestedMapping[0] = true;
		str.nstr.nestedMapping[1] = false;
		delete str;
		delete toDelete;
	}
	function getToDelete() returns (uint res){
		res = toDelete;
	}
	function getTopValue() returns(uint topValue){
		topValue = str.topValue;
	}
	function getNestedValue() returns(uint nestedValue){
		nestedValue = str.nstr.nestedValue;
	}
	function getTopMapping(uint index) returns(uint ret) {
		ret = str.topMapping[index];
	}
	function getNestedMapping(uint index) returns(bool ret) {
		return str.nstr.nestedMapping[index];
	}
}


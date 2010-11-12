if(!Modernizr.borderradius){
	DD_roundies.addRule('.rounded', '5px');
	DD_roundies.addRule('.rounded-trb', '5px 5px 5px 0');
	DD_roundies.addRule('.rounded-tr', '5px 5px 0 0');
	DD_roundies.addRule('.rounded-bl', '0 0 5px 5px');
	DD_roundies.addRule('.rounded-tbl', '5px 0 5px 5px');
	DD_roundies.addRule('.rounded-tl', '5px 0 0 5px');
	DD_roundies.addRule('.rounded-rb', '0 5px 5px 0');
	DD_roundies.addRule('.rounded10', '10px');
	DD_roundies.addRule('.rounded10-tbl', '10px 0 5px 10px');
}
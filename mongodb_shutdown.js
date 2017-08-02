try{
	var db = connect('admin');
	db.auth('root','******');
	rs.status();
}catch(err){
	print('Error:' + err);
}

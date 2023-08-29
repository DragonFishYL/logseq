- 所有权转移
	- 深拷贝所有权不会转移，浅拷贝所有权会转移
		- ```
		  fn string_ts(){
		      let mut a  = String::from("hello");
		      a.push_str(", world!");
		      // let b = a;
		      println!("{}", a);
		      let b = a.clone();
		      println!("a: {} b: {}", a,b);
		      let c = a;
		      // println!("a: {} b: {} c: {}", a,b,c);
		      // 结论：深拷贝所有权不会转移，浅拷贝所有权会转移
		  }
		  ```
	- 以下类型是拥有所有权的类型
		- ```
		  ```
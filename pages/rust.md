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
		  String：代表动态可变字符串，拥有所有权并负责其内存管理。
		  
		  Vec<T>：代表动态可变数组，拥有所有权并负责其内存管理。
		  
		  Box<T>：代表堆上分配的值的所有权。
		  
		  Rc<T>：代表引用计数智能指针，允许多个所有者共享数据。
		  
		  Arc<T>：代表线程安全的引用计数智能指针，允许多个线程共享数据。
		  
		  Mutex<T>：代表互斥锁，用于在多线程环境中保护共享数据的访问。
		  
		  Cell<T> 和 RefCell<T>：代表内部可变性，允许在不可变引用的情况下修改值。
		  
		  自定义类型：你也可以在自己的结构体或枚举类型中实现拥有所有权的语义。
		  ```
- 借用规则
	- 同一时刻，一个变量只能拥有要么一个可变引用, 要么任意多个不可变引用
		- ```
		  let mut s = String::from("hello");
		  
		  let r1 = &s; // 没问题
		  let r2 = &s; // 没问题
		  let r3 = &mut s; // 大问题
		  
		  println!("{}, {}, and {}", r1, r2, r3);
		  ```
	- 引用必须总是有效的
- 字符串
	- 增
		- 追加字符串 push_str() -> Hello rust
		- 追加字符 push() -> Hello rust!
	- 插入
		- 插入字符 insert() -> Hello, rust!
		- 插入字符串 insert_str() -> Hello, I like rust!
	- 替换
		- replace()：可适用于 String 和 &str 类型,方法接收两个参数
			- ```
			  fn main() {
			      let string_replace = String::from("I like rust. Learning rust is my favorite!");
			      let new_string_replace = string_replace.replace("rust", "RUST");
			      dbg!(new_string_replace);
			  }
			  ```
		- replacen(): 该方法可适用于 String 和 &str 类型，replacen() 方法接收三个参数
			- ```
			  fn main() {
			      let string_replace = "I like rust. Learning rust is my favorite!";
			      let new_string_replacen = string_replace.replacen("rust", "RUST", 1);
			      dbg!(new_string_replacen);
			  }
			  ```
		- replace_range():该方法仅适用于 String 类型,replace_range 接收两个参数
			- ```
			  fn main() {
			      let mut string_replace_range = String::from("I like rust!");
			      string_replace_range.replace_range(7..8, "R");
			      dbg!(string_replace_range);
			  }
			  ```
	- 删除
		-
- 标题
	- # 一级
	- ## 二级
	- ### 三级
- 着重
	- **粗体**
	- *斜体*
	- ***粗体和斜体***
- 清单
	- 有序
		- 1. 第一行
		  2. 第二行
	- 无序
		- * 第一行
		  * 第二行
- 块引用
	- > ## 我们热爱自己的国家.
	- > - kk
	- >>fff.
- 代码
	- ```
	  func verifyIos(req *rechargeproto.VerificationEvent, Sandbox bool) (*ResponseData, error) {
	  	url := productAddr
	  	if Sandbox {
	  		url = sandBoxAddr
	  	}
	  	receipt := ReceiptData{Receipt: req.GetReceipt()}
	  	marshal, _ := json.Marshal(receipt)
	  	var err error
	  	for i := 0; i < maxTryCount; i++ {
	  		var res *ResponseData
	  		res, err = tryVerifyIos(marshal, url)
	  		if err != nil {
	  			log.Errorf("tryVerifyIos err: %s", err)
	  			time.Sleep(waitSecond * time.Second)
	  			continue
	  		}
	  		return res, nil
	  	}
	  	return nil, err
	  }
	  ```
- 分割线
	- *****
	- -----
- 链接
	- [百度](https://www.baidu.com)
- 网址
	- <https://www.baidu.com>
- 图片
	- ![美女](http://picview.iituku.com/content/img/202210/28/d8d559e37c46faa8.jpg)
-
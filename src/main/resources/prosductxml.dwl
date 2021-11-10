%dw 2.0
output application/xml


fun getofferPrice(price,discountPercentage)=price*(100-discountPercentage)/100
---

ProductDescription @(productID:payload.productId):
{
	
	pname: payload.name,
	offer:{
		OriginalPrice:payload.originalPrice,
		offeredPrice:getofferPrice(payload.originalPrice,payload.offer.discountPercentage)
		},
	
	productImage:payload.images[0]
} 
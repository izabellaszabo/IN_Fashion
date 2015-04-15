

function addToCart(price,id) {
    var str = document.getElementById("cp1").innerHTML; 
    //var res = str.replace("Test");
    
    //Count of the items in the cart will be null at start
    var count = sessionStorage.getItem("Count");
    
    //Price of the items in the cart will be null at start
    var SessionPrice = sessionStorage.getItem("SessionPrice");
    
    //Strings that the item numer will be appended to
    var strItemId = "Item_ID_";
    var strItemPrice = "Item_Price_"
    
    var ResultValue
    
    //Check to see if the session is null and set to one
    if (count==null){
        //Creating the full Item ID
        strItemId = strItemId.concat("1");
        strItemPrice  = strItemPrice.concat("1");
        sessionStorage.setItem("Count", "1");
        sessionStorage.setItem("TotalPrice", price);
        ResultValue=price;

    }else{
        
        
        
        //Creating the full Item ID
        strItemId = strItemId.concat(count);
        strItemPrice  = strItemPrice.concat(count);
        ResultValue = sessionStorage.getItem("TotalPrice");
        
        count = parseInt(count) +parseInt(1);
        sessionStorage.setItem("Count", count);
        
        ResultValue = parseInt(ResultValue) + parseInt(price);
        
        sessionStorage.setItem("TotalPrice", ResultValue);
        
        //alert("Result Value "+ ResultValue)
        //alert("Price Value "+ price)
        //SessionPrice = +SessionPrice + +price;
        
    }
    
   
    //Storing the values in session storage
    sessionStorage.setItem(strItemId ,id );
    sessionStorage.setItem(strItemPrice , price);
    
    //Setting the price in the top right hand corner
    document.getElementById("cp1").innerHTML = ResultValue;
    
}

function cleardetails(){
    sessionStorage.clear();
    alert("All Details cleared")
}

function listResults() {
    

    
    var LoopCount = sessionStorage.getItem("Count");
    
    //Strings that the loop count will be appended to
    var strItemId = "Item_ID_";
    var strItemPrice = "Item_Price_"
        
        document.write('<form action="cartcreate" method="get">');
        
    for (var i = 1; i <= LoopCount; i++) {

        //Creating the full Item ID
        strItemId = strItemId.concat(i);
        strItemPrice  = strItemPrice.concat(i);
        
        
        var tempItemId = sessionStorage.getItem(strItemId);
        var tempPriceId = sessionStorage.getItem(strItemPrice);
 
        document.write('<div id="cartItem">')
        document.write('<div id="cartTitle">');
        document.write('title=Title');
        document.write('</div>');
        document.write('<div id="cartItem">');
        document.write('<div id="cartQuantity">');
        document.write('Quantity');
        document.write('</div>');
        document.write('<div id="cartPrice">');
        document.write('Price €'+tempPriceId );
        document.write('</div>');
        document.write('</div>');  
        document.write('</div>');
        //Items to post 
        //document.write('<input type="hidden" name="'+strItemId+'" value="'+tempItemId+'" />');
        
        document.write('<input type="hidden" name="'+strItemId +'" value="'+tempItemId+'" />');
        document.write('<input type="hidden" name="'+strItemPrice +'" value="'+tempPriceId+'" />');
        //Reset the strings back
        var strItemPrice = "Item_Price_"
        var strItemId = "Item_ID_"

    }
        document.write('<input type="submit" value="Submit">');
        document.write('</form>');
    
}
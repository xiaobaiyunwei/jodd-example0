package test;

public class DiguiTest {
    public static void main(String[] args) {

    	System.out.println(123%10);  
    	System.out.println(123/10);  
        System.out.println(fun(1234));  
    }  
    public static String fun(int num){  
        if(num>=10){  
            return (num%10)+fun(num/10);  
            //3+2+
        }else{  
//            return String.valueOf(num);  
        	return Integer.toString(num);
        }  
    }  
	
}

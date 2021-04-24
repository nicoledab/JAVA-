package membersJava;

public class PwCheck {
	
	// 비번, 글자range, 
	public boolean charLength(String str, int s, int e) {
		
		int size = str.length();
		return (size  >=s && size  <= e);
		
	}
	
 public boolean charBig(String str) {
		boolean result = false;
		for(int i=0; i<str.length(); i++) {
			char c = str.charAt(i);
			if(c >= 65 && c <= 90) {
				result = true;
			}
		}
		return result; 
	}
 public boolean charsmall(String str) {
			boolean result = false;
			for(int i = 0; i < str.length(); i++) {
				char c = str.charAt(i);
				if(c >= 97 && c <= 122) {
					result = true;
				}
			}
			return result; 
	}
}

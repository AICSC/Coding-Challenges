public class Palindrome{
	public static void main(String[] args){
		String[] arrayOfStrings = { "anna", "house", "fish", "racecar", "civic", "level"};
		int count = isPalindrome(arrayOfStrings);
		System.out.printf("There were %d palindromes in the array\n",count);
		System.out.println("Expected: 4");
	}
	
	public static int isPalindrome(String[] arrayOfStrings){
		int count = 0;
		String word;
		int end;
		for(int i = 0; i < arrayOfStrings.length; i++){
			word = arrayOfStrings[i];
			if(word.equals(reverseWord(word)))
				count++;
		}
		return count;
	}
	
	public static String reverseWord(String word){
		String newWord = ""; 
		for(int i = word.length() - 1; i >= 0; i--){
			newWord += word.charAt(i);
		}
		return newWord;
	}
}

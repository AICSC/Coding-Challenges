
import java.util.Arrays;
public class ChallengeOne {
    public static boolean isPalindrome(String str) {
        boolean palindrome = true;
        int length = str.length();
        for(int i = 0; i < length && palindrome; ++i) {
            if(str.charAt(i) != str.charAt(length - 1 - i)) {
                palindrome = !palindrome;
            }
        }
        return palindrome;
    }
    public static int numPalindromes(String[] arrStr) {
        int paliCount = 0;
        for(String element : arrStr) {
            if (isPalindrome(element)) {
                paliCount++;
            }
        }
        return paliCount;
    }
    
    public static String reverseString(String str) {
        String ret = "";
        int length = str.length();
        for(int i = 0; i < length; ++i) {
            ret += str.charAt(length-1-i);
        }
        return ret;
    }
    public static int numsString(String str) {
        int nums = 0;
        int length = str.length();
        for(int i = 0; i < length; ++i) {
            if (Character.isDigit(str.charAt(i))) {
                nums++;
            }
        }
        return nums;
    }
    public static int lettersString(String str) {
        int letters = 0;
        int length = str.length();
        for(int i = 0; i < length; ++i) {
            if (Character.isLetter(str.charAt(i))) {
                letters++;
            }
        }
        return letters;
    }
    
    public static void main(String[] args) {
        String[] testStrings = {"anna", "racecar", "level", "Jackson5", "reverse", "me", "broseph"};
        System.out.println(Arrays.toString(testStrings));
        System.out.printf("%d palindromes%n", numPalindromes(testStrings));
        System.out.printf("%s has %d letters and %d numbers%n", testStrings[3], lettersString(testStrings[3]), numsString(testStrings[3])); 
        System.out.printf("%s is %s reversed%n", reverseString(testStrings[6]), testStrings[6]);
        
    }

}

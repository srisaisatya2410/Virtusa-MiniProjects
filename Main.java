import java.util.*;
public class Main{
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter your name: ");
        String name=sc.nextLine();

        Quiz quiz=new Quiz();

        quiz.addQuestion(new Questions("What is Java?",new String[]{"Programming Language","Framework","Algorithm","Database"},1));
        
        quiz.addQuestion(new Questions("Which is not OOPS Pillar?", new String[]{"Encapsulation","Inheritance","Array","Abstraction"},3));

        quiz.addQuestion(new Questions("Which of the following keyword supports Muliple Inheritance?", new String[]{"this","interface","abstract","super"},2));

        quiz.addQuestion(new Questions("Which variable can be accessed from anywhere?", new String[]{"Global variable","Static variable","Local variable","Instance variable"},1));

         quiz.addQuestion(new Questions("Which is not Java feature?", new String[]{"Platform Independent","Robust","Multithreading","Allow Pointers"},4));

        quiz.startQuiz(name);
    }
}
import java.util.*;
class Quiz{
    List<Questions> question = new ArrayList<>();
    Scanner sc=new Scanner(System.in);

    public void addQuestion(Questions q){
        question.add(q);
    }
    public void startQuiz(String username){
        int marks=0;

        System.out.println("\nQuiz started, you are given 10 seconds for each question");

        for(Questions q : question){
            q.ShowQuestions();

            long start = System.currentTimeMillis();
            System.out.println("Enter answer: ");
            int ans=sc.nextInt();
            long end = System.currentTimeMillis();

            long timeTaken = (end - start)/1000;

            if(timeTaken>10){
                System.out.println("Time up");
                continue;
            }
            if(q.isCorrect(ans)){
                System.out.println("Correct");
                marks++;
            }else{
                System.out.println("Incorrect");
            }
        }
        showResult(username, marks, question.size());
    }
    private void showResult(String name,int marks,int totalMarks){
        System.out.println("\n=====Result=====");
        System.out.println("User Name: "+name);
        System.out.println("Marks: "+marks+"/"+totalMarks);

        double percentage=(marks*100.0)/totalMarks;
        System.out.println("Percentage: "+percentage);

        if(percentage>=80){
            System.out.println("Excellent Performance");
        }else if(percentage>=50){
            System.out.println("Good Performance");
        }else{
            System.out.println("Perform well next time");
        }
    }
}
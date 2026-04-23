from resume_extracter import extract_text_from_resume
from utils import cleanText
from skill_extraction import skills_data, skills_extract
from resume_score import skills_matcher

resume_text=extract_text_from_resume("resume3.pdf")

tokens=cleanText(resume_text)

skills_db=skills_data("skills_data.txt")

resume_skills=skills_extract(tokens,skills_db)

job_skills=["python","sql","java"]

result=skills_matcher(resume_skills,job_skills)

print("\n=====Resume Analysis Data=====")
print("Matched Skills: ", result["matched_skills"])
print("Match Score: ",result["score"])
print("Missing Skills: ",result["missing_skills"])
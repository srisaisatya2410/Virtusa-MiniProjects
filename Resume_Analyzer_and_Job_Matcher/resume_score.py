def skills_matcher(resume_skills,job_skills):
    matched_skills=set(resume_skills) & set(job_skills)
    missing_skills=set(job_skills)-set(resume_skills)

    score=(len(matched_skills)/len(job_skills))*100 if job_skills else 0

    return{ 
        "score": round(score, 2),
        "matched_skills": list(matched_skills),
        "missing_skills": list(missing_skills)
    }
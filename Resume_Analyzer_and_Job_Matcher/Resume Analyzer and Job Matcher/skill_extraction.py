def skills_data(filepath):
    with open(filepath,'r') as file:
        skills=file.read().splitlines()
    return [skill.lower() for skill in skills]

def skills_extract(tokens,skills_db):
    found_skills=set()
    for token in tokens:
        if token in skills_db:
            found_skills.add(token)
    return list(found_skills)
import PyPDF2
def extract_text_from_resume(filepath):
    text=""
    with open(filepath,'rb') as file:
        reader=PyPDF2.PdfReader(file)
        for page in reader.pages:
            extracted=page.extract_text()
            if extracted:
                text+=extracted
    return text
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class ExtractRequest(BaseModel):
    text: str

class Reminder(BaseModel):
    title: str
    kind: str
    dueDate: str | None = None
    startDate: str | None = None
    endDate: str | None = None
    category: str = "other"
    priority: str = "normal"
    notes: str | None = None
    confidence: float = 0.0

@app.post("/extractReminder", response_model=Reminder)
async def extract(req: ExtractRequest) -> Reminder:
    return Reminder(title="title", kind="someday")

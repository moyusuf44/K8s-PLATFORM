from fastapi import FastAPI 

app = FastAPI()

@app.get("/")
def root():
    return { "message" : "Kubernetes Platform Project is Running" } 

@app.get("/health")
def health ():
    return { "status" : "healthy" }
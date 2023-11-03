# Project Title: Long-Term Memory Chatbot

## Description
This project aims to build a conversational AI with long-term memory capabilities, utilizing OpenAI's ChatGPT and Embeddings APIs. The system will store conversation contexts as embeddings in a PostgreSQL database with pgvector for efficient retrieval. Scikit-learn will be used for embedding search, with options to integrate other libraries like Faiss or Annoy for experimentation. The backend will be built with FastAPI, and the frontend with React. Deployment will leverage Docker, Heroku, and GitHub Actions.

## Requirements
- Python 3.8+
- Docker
- PostgreSQL with pgvector
- OpenAI API keys
- Node.js and npm (for React frontend)

## Local Environment Setup
1. Clone the repository.
2. Install Python dependencies: `pip install -r requirements.txt`
3. Set up a PostgreSQL database and install pgvector.
4. Configure environment variables for OpenAI API access and database credentials.

## Usage

### Backend (FastAPI)
- Navigate to the backend directory.
- Run `uvicorn main:app --reload` to start the FastAPI server.
- The server will handle embedding generation using OpenAI's API, storage, and retrieval of embeddings using PostgreSQL with pgvector.

### Frontend (React)
- Navigate to the frontend directory.
- Run `npm install` to install dependencies.
- Start the development server with `npm start`.

### Database (PostgreSQL with pgvector)
- Ensure PostgreSQL is running and accessible.
- Apply migrations for pgvector support.

### Embedding Generation
- By default, the system will use OpenAI's Embeddings API.
- For local development and experimentation, switch to Hugging Face Transformers by changing the relevant configuration in the backend.

### Embedding Search
- Scikit-learn is used for initial search implementations.
- Optional: Integrate Faiss or Annoy by extending the search service in the backend.

### Summarization
- The OpenAI API is used for summarization by default.
- Modify the summarization endpoint in the backend to experiment with different models or summarization techniques.

### Deployment
- Use Docker to containerize the application.
- Deploy to Heroku using the provided `Procfile`.
- Set up continuous deployment with GitHub Actions using the workflow configuration.

## Experimentation
- The project is designed to allow swapping out components:
  - **Embedding Search**: Replace Scikit-learn with Faiss or Annoy by updating the search service.
  - **Summarization**: Point to different OpenAI models or implement a custom summarization pipeline.

## Contributing
Contributions are welcome. Please open an issue to discuss the proposed changes or submit a pull request.

## License
Specify the license under which the project is made available.

## Contact
Provide details on how to reach out for questions or discussions about the project.

---

### Note
This README is a template and will require specific details for each section, such as installation commands, configuration instructions, and usage details based on the actual implementation. Replace placeholders with actual values as you develop the project.
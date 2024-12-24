<h1><center>Pipeline HCM AI CHALLENGE <br> Event Retrieval from Visual Data</center></h1>

# Image Search and Text Search Application

This project is a web-based application for searching images using visual or textual queries. The application leverages FAISS for similarity search, CLIP for text-image embedding, and translation utilities to support multi-language input.

## Features

- **Image Thumbnail Viewer:** Display image thumbnails with pagination.
- **Image Search:** Search for visually similar images by providing an image ID.
- **Text Search:** Search for images using a text description, supporting Vietnamese and English inputs.
- **Dynamic Image Rendering:** Serve images with custom overlays using OpenCV.

## Requirements

- Python 3.8 or higher
- Docker (optional for containerized deployment)

### Key Dependencies
- Flask: Web framework
- FAISS: Vector similarity search
- OpenAI CLIP: Text and image embeddings
- LangDetect: Language detection
- PyVi, Underthesea: Vietnamese text processing
- Googletrans, Translate: Translation tools

For a full list of dependencies, refer to `requirements.txt`.

## Setup Instructions

### Running Locally

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd HCMAI2023
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   pip install git+https://github.com/openai/CLIP.git
   ```

3. Add the required data files:
   - **`image_path.json`**: Maps image IDs to file paths.
   - **`faiss_normal_ViT.bin`**: Pretrained FAISS index file.

4. Start the application:
   ```bash
   python app.py
   ```

5. Access the app in your browser at `http://localhost:8000`.

### Using Docker

1. Build the Docker image:
   ```bash
   docker build -t image-search-app .
   ```

2. Run the container:
   ```bash
   docker run -p 8000:8000 image-search-app
   ```

3. Access the app at `http://localhost:8000`.

## Application Structure

```
HCMAI2023/
├── app.py                # Main Flask application
├── templates/            # HTML templates
├── static/               # Static assets (CSS, JS, images)
├── utils/
│   ├── query_processing.py   # Translation and text preprocessing utilities
│   ├── faiss.py              # FAISS integration and embedding logic
├── Dockerfile            # Docker configuration
├── requirements.txt      # Python dependencies
├── image_path.json       # JSON mapping image IDs to file paths
├── faiss_normal_ViT.bin  # Pretrained FAISS index
```

## API Endpoints

### `/home` or `/`
- **Method:** GET
- **Description:** Displays thumbnails for images with pagination.
- **Query Params:**
  - `index` (optional): Page number (default is 0).

### `/imgsearch`
- **Method:** GET
- **Description:** Searches for visually similar images.
- **Query Params:**
  - `imgid`: ID of the query image.

### `/textsearch`
- **Method:** GET
- **Description:** Searches for images using a text description.
- **Query Params:**
  - `textquery`: Text query string.

### `/get_img`
- **Method:** GET
- **Description:** Renders and overlays metadata on the requested image.
- **Query Params:**
  - `fpath`: Path to the image file.

## Customization

- **Translation Support:** Extend or modify the `Translation` class in `utils/query_processing.py` for additional languages.
- **Index File:** Update the FAISS index file path in `app.py` to use a different dataset.

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request for review.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Happy coding! 🚀

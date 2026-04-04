from flask import Flask
from flask_cors import CORS
from controllers.CompanyController import company_bp

def create_app():
    app = Flask(__name__)
    CORS(app)
    app.register_blueprint(company_bp)
    return app

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True)
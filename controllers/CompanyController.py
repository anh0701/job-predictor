from flask import Blueprint, request, jsonify

company_bp = Blueprint("analyze", __name__)

@company_bp.route("/api/company", methods=["GET"])
def analyze():
    
    return jsonify({
        "summary": "Test"
    })
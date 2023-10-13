import sys
from setuptools import setup

setup(
    name="sample-backend",
    version="0.0.1",
    install_requires=[
        "fastapi == 0.95.1",
        "uvicorn[standard] == 0.19.0",
    ],
    extras_require={
        "dev": [
            "black ~= 22.10.0",
            "pytest ~= 7.1.3",
            "httpx ~= 0.25.0",
        ]
    },
    python_requires=">=3.9",
)

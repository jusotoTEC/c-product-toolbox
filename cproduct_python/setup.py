from setuptools import setup, find_packages

setup(
    name="cproduct",
    version="1.0",
    packages=find_packages(),
    install_requires=[
        "numpy",
        "scipy"
    ],
)
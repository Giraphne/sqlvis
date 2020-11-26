import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="sqlvis", 
    version="0.0.5",
    author="Daphne Miedema",
    author_email="daphnemiedema@hotmail.com",
    description="A package to represent SQL queries as graphs.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/Giraphne/sqlvis",
    packages=setuptools.find_packages(),
    package_data={'': ['sqlvis/*']},
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)
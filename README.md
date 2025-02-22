
<p align="center"><img  src="https://github.com/jusotoTEC/c-product-toolbox/blob/main/img/logo.png" e="width: 75%; height: 75%;"></p>


## Description 

### *C-Product Toolbox*: A Computational Package for Third-Order Tensor Operations

The *C-Product Toolbox* is a computational package designed to facilitate third-order tensor operations based on the reduced *c*-product, a variation of the standard *c*-product that improves computational efficiency. This toolbox is available for both MATLAB and Python, making it accessible to researchers and practitioners in scientific computing, signal processing, and image processing.

In general, tensor algebra extends the concepts of matrices to higher dimensions, allowing for advanced mathematical operations in multidimensional spaces. Among different tensor multiplication frameworks, the *t*-product and *c*-product have gained attention due to their flexibility and efficiency in various applications. While the *t*-product benefits from the Fast Fourier Transform, it requires intermediate complex arithmetic, increasing computational cost. On the other hand, the *c*-product, which relies on the Discrete Cosine Transform, operates entirely with real arithmetic, offering advantages in memory usage and execution speed.

The *C-Product Toolbox* is specifically built around the reduced *c*-product, which optimizes tensor computations by reducing the required arithmetic operations and improving memory efficiency. Unlike existing packages in the literature, which default to the *t*-product, this new toolbox provides a dedicated and optimized implementation for *c*-product-based tensor operations.


<p align="center"><img  src="https://github.com/jusotoTEC/c-product-toolbox/blob/main/img/img1.png" e="width: 75%; height: 75%;"></p>


### Key Features and Advantages

* **Efficient Computation**: The reduced *c*-product minimizes computational complexity by using real arithmetic, leading to lower memory usage and faster execution compared to traditional tensor multiplication methods.
* **Extended Tensor Operations**: The toolbox includes various functions not available in existing tensor computation packages, such as tensor pseudoinverse, the drazin tensor inverse, and the least squares solutions for tensor equations.
* **Multi-Platform Support**: While initially developed for MATLAB, the *C-Product Toolbox* has also been fully implemented in Python, utilizing the *NumPy* and *SciPy* libraries, ensuring broader accessibility.
* **Applications in Image and Signal Processing**: The toolbox has been tested in various applications, including video denoising, showcasing its practical advantages over traditional tensor computation methods.

### Why Use the *C-Product Toolbox*?

The primary motivation behind this toolbox is to address the limitations of existing tensor computation frameworks. The *C-Product Toolbox* introduces optimized algorithms that significantly reduce computational costs while providing cross-platform compatibility.

### Scientific paper related with the *C-Product Toolbox*

The *C-Product Toolbox* is associated with the scientific article "***C-Product Toolbox*:  A computational package for third-order tensor operations based on the reduced c-product**." This scientific paper has been submitted for review in a scientific journal and is currently under peer review. The numerical experiments included in this repository are explained in detail in the paper.


## Authors

This project is developed by researchers from the *Instituto Tecnológico de Costa Rica*, Central Campus, in Cartago, Costa Rica:

* **Pablo Soto-Quiros** (jusoto@tec.ac.cr) – Professor at the School of Mathematics and the School of Computer Engineering.
* **Samuel Valverde-Sanchez** (savalverde@itcr.ac.cr) – Professor at the School of Mathematics.
* **Luis Chavarria-Zamora** (lachavarria@itcr.ac.cr) – Professor at the School of Computer Engineering.

## Version History 

### Version 1.0

Version 1.0 of the *C-Product Toolbox* was developed in February 2025. This version includes the following:

* Computational implementation in MATLAB and Python of the functions `cprod`, `cinprod`, `ceye`, `ctransp`, `csvd`, `cqr`, `csqrtt`, `ctubalrank`, `cmultirank`, `cinv`, `cpinv`, `cdrazin`, `cnorm`, `clowrank`, `csvt`, and `clsq`.
* Development of the `test_toolbox` file for both MATLAB and Python, which serves as a test suite for the functions in the *C-Product Toolbox*.
* Creation of user manuals for the *C-Product Toolbox* in both English and Spanish.
* Inclusion of the numerical experiments presented in the paper"***C-Product Toolbox*:  A computational package for third-order tensor operations based on the reduced c-product**."

## Citation

To cite the *C-Product Toolbox*, please use the following reference.

```
@manual{soto2025cproduct,
  author       = {Soto-Quiros, Pablo and Valverde-Sanchez, Samuel and Chavarria-Zamora, Luis},
  title        = {C-Product Toolbox - Version 1.0},
  organization = {Instituto Tecnológico de Costa Rica},
  month        = {February},
  year         = {2025},
  note         = {\url{https://github.com/jusotoTEC/c-product-toolbox}}
}  
```

## Acknowledgments

*C-Product Toolbox* was developed by professors Pablo Soto-Quiros, Samuel Valverde-Sanchez and Luis Chavarria-Zamora in the GLRTA project (#1440054) from January 2024 to December 2025. The GLRTA project is affiliated with the *Vicerrectoría de Investigación* at the *Instituto Tecnológico de Costa Rica*.

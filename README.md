# HR-Analytics
Predict who will move to a new job

The dataset was taken from [HR Analytics: Job Change of Data Scientists](https://www.kaggle.com/arashnic/hr-analytics-job-change-of-data-scientists)

*Features*
* enrollee_id : Unique ID for candidate
* city: City code
* city_ development _index : Developement index of the city (scaled)
* gender: Gender of candidate
* relevent_experience: Relevant experience of candidate
* enrolled_university: Type of University course enrolled if any
* education_level: Education level of candidate
* major_discipline :Education major discipline of candidate
* experience: Candidate total experience in years
* company_size: No of employees in current employer's company
* company_type : Type of current employer
* lastnewjob: Difference in years between previous job and current job
* training_hours: training hours completed
* target: 0 – Not looking for job change, 1 – Looking for a job change

*Steps*
1. Preprocessing: Cleaning, missing and outliers; worked in R
2. Exploratory Data Analysis
3. Get ready the data
4. Choose and fit a model
5. Improve the model and evaluate
6. Feature engineering
7. Experimentation

## Installation 

This project uses conda as a environment/package manager. To easily run this project in your machine, you should have ananconda or miniconda installed (You might want to refer to [Conda documentation](https://docs.conda.io/en/latest/index.html)). Alternatively, you can use your preferred method to install the required dependencies (`jupyter`, `NumPy`, `Pandas`, `Matplotlib` and `scikit-learn`); use the versions stated in the environment.yml file to reproduce the same environment used for this project..

First, clone this repository to your machine:

```bash
git clone https://github.com/renzoo123t/HR-Analytics.git
```
### Using conda

Then, create the environment folder with the dependencies within the project directory:

```bash
conda env create --prefix ./env -f ./environment.yml
```

Activate the environment, with:

```bash
conda activate ./env
```

And finally, if dependencies are correctly installed, you should be able to run:

```bash
jupyter notebook
```
### Troubleshooting

When creating the enviroment, you may encounter `ResolvePackageNotFound` problem:

```bash
ResolvePackageNotFound:
  - dependencies not found
```
To solve the problem, move the problematic dependecies under pip section in the .yml file, like:

```yml
dependencies:
  - appnope=0.1.0=py38_0
  - attrs=19.3.0=py_0
  - backcall=0.1.0=py38_0
  - blas=1.0=mkl
  - bleach=3.1.4=py_0
  - ca-certificates=2020.6.24=0
  - certifi=2020.6.20=py38_0
  - cycler=0.10.0=py38_0
  - dbus=1.13.14=h517e14e_0
  - decorator=4.4.2=py_0
  - defusedxml=0.6.0=py_0
  ** all dependencies, except those not found **
  - pip:
    - jedi=0.17.0=py38_0
    - jinja2=2.11.2=py_0
    - joblib=0.15.1=py_0
    - jpeg=9b=he5867d9_2
    - jsonschema=3.2.0=py38_0
    - jupyter=1.0.0=py38_7
    - jupyter_client=6.1.3=py_0
    - jupyter_console=6.1.0=py_0
    - jupyter_core=4.6.3=py38_0
    - kiwisolver=1.2.0=py38h04f5b5a_0
    - libcxx=10.0.0=1
    - libedit=3.1.20181209=hb402a30_0
    - libffi=3.3=h0a44026_1
    - libgfortran=3.0.1=h93005f0_2
    - libiconv=1.16=h1de35cc_0
    - libpng=1.6.37=ha441bb4_0
    *** All dependencies not found ***
```

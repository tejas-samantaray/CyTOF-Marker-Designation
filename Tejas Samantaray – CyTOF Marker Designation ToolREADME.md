# CyTOF-Marker-Designation
CyTOF FCS File Renaming & Formatting Script

This repository contains an R-based workflow for correcting improperly labeled or unlabeled .FCS files generated from CyTOF experiments, enabling compatibility with downstream analysis tools. This issue often occurs during the aquring of data if a labeled template has not been added to the CyTOF software prior to starting which leads to unlabled FCS files.

🧬 Overview

Mass cytometry (CyTOF) datasets often contain .FCS files with inconsistent or missing metadata, particularly in channel naming or marker annotation. This creates major issues for downstream analysis in platforms such as:

FlowJo

FCS Express

MaxPar Pathsetter (CyTOF ONLY)


🧬 This script provides a streamlined approach to:

Standardize channel names

Restore or assign marker labels

Ensure proper formatting for downstream pipelines

Reduce manual preprocessing time


⚙️ Features

Automated renaming of CyTOF channels

Handles partially labeled or fully unlabeled .FCS files

Custom mapping of metal channels → biological markers

Compatible with common cytometry workflows

Easily adaptable for different antibody panels


🧬 Made by Tejas Samantaray

Ovarian cancer research analyst (lab technician) | Tumor microenvironment and CAF Biology | Proteomics & single-cell analysis

@tejas.samantaray@bsd.uchicago.edu

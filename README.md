# CyTOF-Marker-Designation
Did you forget to load the CyTOF aquiring template while recording your data? This script will allow you to re-designate the correct metal isotope tag (eg: 144Nd, 95Pt, etc) to the biological marker (CD45, CD326, CDxx) if this mistake happened so that various analysis softwares can recognize your FCS files (eg: MaxPar Pathsetter).


The "unlabeled" issue likely comes from using an unlabeled template (during acquiring on the Helios Mass Cytometer). Target names cannot be added post-acquisitions on CyTOF acquisition software, but using R we can apply our panel designations to the FCS files.


This script can also be used to rename FCS files and assigning the correct fluorophore/color to the marker of choice, if this was done incorrectly at the conventional or spectral flow cytometer. Slight edits may have to be made, but consult ChatGPT to do so correctly.

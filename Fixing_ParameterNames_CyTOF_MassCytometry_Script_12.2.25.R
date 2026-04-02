install.packages("BiocManager")
BiocManager::install("flowCore")

library(flowCore)

# --- Load file
fcs_file <- "Z:/Lengyel Lab/_Projects/Tejas Samantaray/BCL-2 Inhibitor Immune Landscape CyTOF Experiments/Sample #5C FCS files/5C 11062025_1_normalized_concatenated.fcs"
f <- read.FCS(fcs_file, transformation = FALSE)

# --- Extract parameters
p <- parameters(f)
df <- p@data
df$name <- trimws(df$name)                 # Clean channel names
if (is.null(df$desc)) df$desc <- NA        # Ensure desc exists

# --- Mapping
mapping <- c(
  "Y89Di"="CD45","Rh103Di"="Live_Dead","Ce140Di"="Beads","Ce142Di"="Beads",
  "Ir191Di"="DNA1","Eu153Di"="CD25","Lu175Di"="Beads","Ho165Di"="Beads",
  "Eu151Di"="CD161","Ir193Di"="DNA2","Gd156Di"="CXCR3","Nd150Di"="CD45RA",
  "Nd145Di"="CD4","Nd144Di"="CD19","Sm154Di"="CD27","Sm152Di"="CD194_CCR4",
  "Gd160Di"="CD28","Gd158Di"="CXCR5","Gd155Di"="CD57","Dy164Di"="TCRgd",
  "Er170Di"="CD3","Er166Di"="CD294","Er168Di"="CD14","Yb176Di"="CD127_IL-7Ra",
  "Yb172Di"="CD66b","Yb174Di"="IgD","Yb171Di"="CD20","Sm147Di"="CD11c",
  "Nd146Di"="CD8a","Dy161Di"="CD38","Er167Di"="CD197_CCR7","Pr141Di"="CD196_CCR6",
  "Nd148Di"="CD16","Dy163Di"="CD56_NCAM","Yb173Di"="HLADR","Nd143Di"="CD123_IL-3R",
  "Sm149Di"="CD45RO"
)

# Apply mapping
idx <- match(df$name, names(mapping))
df$desc[!is.na(idx)] <- mapping[idx[!is.na(idx)]]

# Sanitize desc for Pathsetter
df$desc <- gsub("[^A-Za-z0-9_\\-]", "_", df$desc)
df$desc <- as.character(df$desc)

# Update parameters
p@data <- df
parameters(f) <- p

# Update keywords (modern way)
for (i in seq_len(nrow(df))) {
  keyword(f)[[paste0("$P", i, "N")]] <- df$name[i]
  keyword(f)[[paste0("$P", i, "S")]] <- df$desc[i]
}

# --- Write cleaned FCS (default binary)
out_file <- "Z:/Lengyel Lab/_Projects/Tejas Samantaray/BCL-2 Inhibitor Immune Landscape CyTOF Experiments/Sample #5C FCS files/#5C_normalized_concatenated_FIXED.fcs"
write.FCS(f, out_file)

# --- Sanity checks
f_orig <- read.FCS(fcs_file, transformation = FALSE)
f_fix <- read.FCS(out_file, transformation = FALSE)

cat("Original event count:", nrow(exprs(f_orig)), "\n")
cat("Fixed event count:   ", nrow(exprs(f_fix)), "\n\n")

cat("Original channel count:", ncol(exprs(f_orig)), "\n")
cat("Fixed channel count:   ", ncol(exprs(f_fix)), "\n")

# Check updated marker names
pData(parameters(f_fix))[, c("name", "desc")]

######## Issue with radial orientation of custom symbols on tree ########
# Issue: cannot change orientation of custom-made symbols at tips of a circular phylogeny
# I have up to 14 custom-made symbols to map onto the tips of a large tree. I need each symbol to be oriented radially.
# I have created a small reproducible example with colored squares. This requires downloading a folder of 6 .png image files hosted on my github page.

# Packages
library("ggtree") # v(2.0.4)
library("ggimage") # v(0.2.8)
library("ggplot2") # v(3.3.3)
# I am running R version 3.6.3 (2020-02-29)

# Create example tree
tree = read.tree(text = "((((Nigetia_formosalis, Abablemma_duomaculata), Arugisa_lutea), (Phytometra_rhodarialis, Hypsoropha_monilis)), Papilio_rutulus);")

# Create annotation vectors
trait1 <- c(rep("red.png", 6), rep(NA, 5))
trait2 <- c(rep("orange.png", 6), rep(NA, 5))
trait3 <- c(rep("yellow.png", 6), rep(NA, 5))
trait4 <- c(rep("green.png", 6), rep(NA, 5))
trait5 <- c(rep("blue.png", 6), rep(NA, 5))
trait6 <- c(rep("purple.png", 6), rep(NA, 5))

# Set directory to external folder of files
# 1) go to www.github.com/moria-robinson / R.examples
# 2) download "symbols" folder (should contain 6 .png image files, each a colored square)
# 3) set local path to folder; this navigates to 'downloads' folder
setwd("~/Downloads/symbols")

# Create tree. Issue: symbols do not rotate. Goal is that each set of symbols is rotated radially (e.g. at each tip, symbols should look like they do for the species on the horizontal axis - Hypsoropha and Abablemma)
# - I show the different angle commands I tried in different rows
tree.out <- ggtree(tree, layout="circular") + 
  geom_tiplab(size=2, offset=0.25, color="black", align=TRUE) +
  geom_image(image=trait1, angle=0, nudge_x = 24, size=.02) +
  geom_image(image=trait2, angle=45, nudge_x = 28, size=.02) + 
  geom_image(image=trait3, angle=90, nudge_x = 32, size=.02) +
  geom_image(image=trait4, angle=90, nudge_x = 36, size=.02) +
  geom_image(image=trait5, angle=90, nudge_x = 40, size=.02) +
  geom_image(image=trait6, angle=90, nudge_x = 44, size=.02) +
  ggplot2::xlim(-35, 35)
tree.out # preview as a PDF 8 x 8 

# This will save a PDF of the tree in the downloads folder
pdf("~/Downloads/tree.out.pdf", width=8, height=8)
tree.out
dev.off()

# I have followed the ggimage vignette, and also tried angle commands described in threads here (https://groups.google.com/g/bioc-ggtree/c/o35PV3iHO-0) and here (https://github.com/YuLab-SMU/ggtree/issues/17) (e.g. using angle=angle, or angle=angle+90 for radial orientation), but none change the symbol angle. Again, the goal is all radial orientation.
#     geom_image(aes(image=trait4, angle=angle), nudge_x = 36, size=.02) +
#     geom_image(image=trait5, aes(angle=angle), nudge_x = 40, size=.02) +
#     geom_image(image=trait6, angle="angle", nudge_x = 44, size=.02) +


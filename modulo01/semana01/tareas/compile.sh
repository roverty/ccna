mkdir -p .build
pdflatex -output-directory=.build/ $1
mv .build/*.pdf . 

@echo off
echo === Initializare proiect GitHub Pages ===

REM Initializare git (daca nu exista)
git init

REM Creare index.html
echo ^<!DOCTYPE html^> > index.html
echo ^<html lang="ro"^> >> index.html
echo ^<head^> >> index.html
echo     ^<meta charset="UTF-8"^> >> index.html
echo     ^<title^>Site automat^</title^> >> index.html
echo     ^<link rel="stylesheet" href="style.css"^> >> index.html
echo ^</head^> >> index.html
echo ^<body^> >> index.html
echo     ^<h1^>Salut! Site generat automat.^</h1^> >> index.html
echo     ^<p^>Publicat cu GitHub Pages.^</p^> >> index.html
echo     ^<img src="https://tse1.explicit.bing.net/th/id/OIP.fqZ9-PPqcG_cm0k3JfoINQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3" alt="img"^> >> index.html
echo ^</body^> >> index.html
echo ^</html^> >> index.html

REM Creare style.css
echo body { font-family: Arial; text-align: center; background: #f0f0f0; } > style.css
echo h1 { color: #2c3e50; } >> style.css
echo img { width: 300px; margin-top: 20px; } >> style.css

REM Creeaza folder workflow
mkdir .github
mkdir .github\workflows

REM Creare deploy.yml
(
echo name: Deploy GitHub Pages
echo.
echo on:
echo   push:
echo     branches:
echo       - main
echo.
echo jobs:
echo   deploy:
echo     runs-on: ubuntu-latest
echo.
echo     steps:
echo       - name: Checkout
echo         uses: actions/checkout@v3
echo.
echo       - name: Setup Pages
echo         uses: actions/configure-pages@v3
echo.
echo       - name: Upload artifact
echo         uses: actions/upload-pages-artifact@v2
echo         with:
echo           path: .
echo.
echo       - name: Deploy
echo         uses: actions/deploy-pages@v2
) > .github\workflows\deploy.yml

REM Adauga fisierele
git add .

REM Commit
git commit -m "Initial commit GitHub Pages"

REM Setare branch main
git branch -M main

REM ATENTIE: schimba URL-ul cu repo-ul tau!
git remote add origin https://github.com/crisstond/laboratorul_6.git

REM Push
git push -u origin main

echo === Gata! ===
echo Acum activeaza GitHub Pages din Settings si selecteaza GitHub Actions.
pause
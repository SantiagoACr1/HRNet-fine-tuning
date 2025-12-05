# 🛰️ Segmentación semántica con HRNet

Este repositorio contiene la **Evaluación de la adaptabilidad del modelo HRNet en segmentación semántica de uso y cobertura del suelo**.  

El proyecto se desarrolló y ejecutó principalmente en **Google Colab** usando **PyTorch**.

El conjunto de datos se encuentra en: https://drive.google.com/drive/folders/12qTzHrCekAGmhUnxHahUWpo2gwPC_DgN?usp=drive_link

---

## 📁 Estructura del proyecto

```
HRNet-fine-tuning/
│
├── eval.py                   # Evaluación del modelo y cálculo de métricas
├── predict.py                # Generación de estimaciones sobre el conjunto de test
├── train.py                  # Entrenamiento del modelo sobre el nuevo conjunto de datos
├── scripts/
│   ├── predict_test.sh       # Script Bash para ejecutar la inferencia
│   ├── train.sh              # Script Bash para ejecutar el entrenamiento
│   └── eval_hrnetw32.sh      # Script Bash para la evaluación
├── configs                   # Configuración del modelo HRNet-W32
└── README.md
```

---

## ⚙️ Requisitos

Instala las dependencias principales:

```bash
pip install torch torchvision
```


---

## 🚀 Ejecución

### 1. Entrenar HRNet con nuevas imágenes

Ejecuta el script de entrenamiento:

```bash
!bash ./scripts/train_hrnetw32.sh
```

Este comando:
- Carga los pesos del modelo de LoveDA
- Ajusta el modelo a las nuevas clases
- Calcula las pérdidas por época

---

### 2. Generar estimaciones

Ejecuta el script de predicción:

```bash
!bash ./scripts/predict_test.sh
```

Este comando:
- Carga los pesos del modelo reentrenado
- Procesa las imágenes del conjunto **Test**
- Guarda las estimaciones segmentadas en la carpeta `out/`

---

### 3. Evaluar el modelo

Para calcular métricas como **IoU**, **mIoU**, **precisión** y generar la **matriz de confusión**, usa:

```bash
!bash ./scripts/eval_hrnetw32.sh
```

Salida esperada:
- Métricas por clase en consola  
- Archivo `.npy` con la matriz de confusión:
  ```
  ./log/confusion_matrix.npy
  ```

---

## 📊 Resultados esperados

Durante la ejecución del script de evaluación se generan:

- **IoU (%) por clase**
- **mIoU (%) total**
- **Matriz de confusión (normalizada y en valores absolutos)**
- **Visualizaciones de comparación** entre la imagen original y la estimación.

---

## 🧠 Referencia

> Wang, J., et al. (2021). **LoveDA: A Remote Sensing Land-Cover Dataset for Domain Adaptive Semantic Segmentation.** *NeurIPS Datasets and Benchmarks Track.*

---

## 🧩 Autor

**Cristian Acuña**  
Universidad Nacional de Colombia  
Repositorio de réplica experimental para el dataset **LoveDA** usando **HRNet-W32**.

---


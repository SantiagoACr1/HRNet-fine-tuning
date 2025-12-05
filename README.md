# 🛰️ Réplica de segmentación semántica con LoveDA con HRNet

Este repositorio contiene la **Evaluación de la reproducibilidad y el desempeño del modelo HRNet en la segmentación semántica de uso y cobertura del suelo con el conjunto de datos
LoveDA**.  
El proyecto se desarrolló y ejecutó principalmente en **Google Colab** usando **PyTorch** y la estructura oficial del repositorio **LoveDA (https://github.com/Junjue-Wang/LoveDA/tree/master/Semantic_Segmentation)**.
La segmentación realizada por Wang et al. (2021) contiene 11 arquitecturas, pero la réplica se realiza sólo sobre HRNet, por tanto, el repositorio se estructura con base en los requerimientos para esa arquitectura
---

## 📁 Estructura del proyecto

```
Replication-LoveDA/
│
├── eval.py                   # Evaluación del modelo y cálculo de métricas
├── predict.py                # Generación de estimaciones sobre el conjunto de test
├── scripts/
│   ├── predict_test.sh       # Script Bash para ejecutar la inferencia
│   └── eval_hrnetw32.sh      # Script Bash para la evaluación
├── configs/
│   └── baseline.hrnetw32     # Configuración del modelo HRNet-W32
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

### 1. Generar predicciones

Ejecuta el script de predicción:

```bash
!bash ./scripts/predict_test.sh
```

Este comando:
- Carga los pesos del modelo (`hrnetw32.pth`)
- Procesa las imágenes del conjunto **Test** de LoveDA
- Guarda las estimaciones segmentadas en la carpeta `out/`

---

### 2. Evaluar el modelo

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
- Imágenes de validación coloreadas según el `COLOR_MAP`.

---

## 🎨 Leyenda de clases LoveDA

| Código | Clase        | Color (RGB)  |
|--------:|--------------|--------------|
| 0 | Building     | Rojo (255, 0, 0) |
| 1 | Road         | Amarillo (255, 255, 0) |
| 2 | Water        | Azul (0, 0, 255) |
| 3 | Barren       | Lila (200, 0, 200) |
| 4 | Forest       | Verde (0, 255, 0) |
| 5 | Agriculture  | Naranja pálido (255, 200, 100) |
| 6 | Background   | Blanco (255, 255, 255) |

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


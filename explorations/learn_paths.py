import pandas as pd
from pathlib import Path
DATA_PATH = Path(__file__).parent / "data"
#print(DATA_PATH)

df = pd.read_csv(DATA_PATH / "test.csv")
print(df)
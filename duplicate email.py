import pandas as pd

def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:
    return person.groupby("email").size().loc[lambda x: x > 1].reset_index()[["email"]]

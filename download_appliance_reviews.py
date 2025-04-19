from datasets import load_dataset

dataset = load_dataset("McAuley-Lab/Amazon-Reviews-2023",
                       "raw_meta_Appliances", split="full", trust_remote_code=True)

df = dataset.to_pandas()

df.to_csv("amazon_appliance_reviews.csv", index=False)

print("✅ Dataset downloaded and saved as amazon_appliance_reviews.csv")

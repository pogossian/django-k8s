folders=(
    # apps name that should be migrate
)

for i in "${folders[@]}"; do
    mkdir $i/migrations/
    touch $i/migrations/__init__.py
done

python3 manage.py makemigrations

python3 manage.py migrate
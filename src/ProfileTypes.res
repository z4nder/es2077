type profile = {
    name: string,
    age: int
}

type person = | User(profile) | Admin(profile) | Person(profile)
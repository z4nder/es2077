let value = 12

let value' = ""

let valueInt = 12
let valueFLoat = 12.0

let res = 23.43 +. valueFLoat
let resFloat = valueFLoat->Belt.Float.toInt + valueInt

let string = `1290 ${"Jello"} ${valueInt->Belt.Int.toString}`

let isTrue = true
let isFalse = !!true && false

let arr: array<int> = [1, 2, 3]

let (a, b, c) = (1, 2, 3)
let myTuple = (1, 2, 3)

let myRef = ref(2) // Mutavel
myRef.contents = 12

// User defined types

// open ProfileTypes
let userProfile: ProfileTypes.profile = {
    name: "Peter",
    age: 12
}

type profile = {
    name: string,
    age: int
}

let anotherUserProfile: profile = {
    name: "Peter",
    age: 12
}

// ADT, Algebraic Data Types, variants

// type person = | User(profile) | Admin(profile) | Person(profile)

let gustavo: ProfileTypes.person = User({
    name: "Gustavo",
    age: 21
})

let fn = (person: ProfileTypes.person) => {
    //unboxing
    switch (person) {
        | User({name: "Gustavo"}) => `Hello Gustav-kun`
        | User({name}) => `Hello User, ${name}`
        | Admin({name}) => `Hello Admin, ${name}`
        | Person({name}) => `Hello Person, ${name}`
    }    
}

//polyvariant

type role = [#admin | #user | #masteradmin]
let myProfileRole: role = #admin

let myProfileRoleAdmin = #admin
let myProfileRoleUser = #user
let hello = (role) => {
    switch (role) {
        | #admin => "Hello Admin"
        | #user => "Hello user"
    }
}

let _ = hello(myProfileRoleAdmin)

// Functions

let userGustavo: ProfileTypes.person = User({
    name: "Gustavo",
    age: 21
})

//~person usada para nomear parametros
// Preciso coloar () pois eu posso chamar a função varias vezes passando um parametro por vez
let sayHello = (~person: ProfileTypes.person, ~isSpecial: bool=false, ()) => {
    
    switch (person) {
        | User({name: "Gustavo"}) if isSpecial => `Hello Gustav-kun`
        | User({name: "Gustavo"}) => `Hello Gustav-kun`
        | User({name}) => `Hello User, ${name}`
        | Admin({name}) => `Hello Admin, ${name}`
        | Person({name}) => `Hello Person, ${name}`
    }    
}

let msg = sayHello(~isSpecial=false, ~person=userGustavo)
let otherMessage = sayHello(~person=userGustavo)

// Expressões

let _ = 
<div>{
    if(myProfileRole == #user) {React.string("user")}
    else { React.null }
}</div>

// pipe

let sumX = (str, ~isSpecial) => isSpecial ? `${str}-special`: `${str}-non-especial`
let sumY = (str) => `${str}-y`
let sumZ = (str) => `${str}-z`

let str = "Gustav"
// let result = sumZ(sumY(sumX(str, ~isSpecial=false))) Old sintax
let result = str
    ->sumX(~isSpecial=true)
    ->sumY
    ->sumZ
// Variables

// string
string public NameOfMyString = "My name nah rashford, I be 21 years old"

/* bool; true or false
This na data type wey go break down to either true or false

*/
bool public ThisNaMyBool = false
bool public isTrue = true;
bool public isFalse = false;


/* UNSIGNED INTEGERS: uint

The uint data type or unsigned integer, nah number wey be only positive number
*/
uint256 public PositiveNumber = 123;


/* SIGNED INTEGERS: int
*/
uint256 public NegativeNumber = -123;


/* ENUM
enum na data type wey we fit store option inside

we name our enum data Status and we give am 3 options Active, Inactive, and Pending. we fit call each option with status. Active to set your option
*/
enum Status {Active, Inactive, Pending}
Status  public currenyStatus = Status.Active;

/* Bytes na data type wey we fit take store fixed data make memory no waste, for example, Byte32 store 32 characters or things wey we type give am then he go convert to hexadecimal format like this 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef make computer and other smart contract fit read am.
this code go give error base on say na only 2 bytes we set am put.
*/
bytes2 public NameOfBytes = "Rash"

/* This one na just data type for solidity wey dey collect EVM wallet address (EVM na Ethereum Virtual Machine or computer)
*/
address public owner = 0xc8Ed6D535D08fc4435Fea832C78B866e7ed1F40a;


/* ARRAY FIXED ARRAY AND DYNAMIC ARRAY
Array dey group informate or element of the same data type together, fixed array get fixed number of informate wey e fit collect and dynamic no get.
*/

uint256[] public numbers = [1, 2, 3, 4, 5];
address[] public addresses = [0xc8Ed6D535D08fc4435Fea832C78B866e7ed1F40a, 0xc8Ed6D535D08fc4435Fea832C78B866e7ed1F40a]



/* STRUCT
This na data type we be structure we fit take collect  and set variable how we like am 
for this code we one build struct of different cars, we one put informate like the brand , color and price and we go use string and int data type
*/


struct Cars {
    string brand;
    uint256 price;
    string color;
}
/* Na just structure be this code wey dey up , the code wey dey down go fit add many cars with this 3 informate,
 */
 Cars public Mycar1 = Cars("LAMBO", 250000, "yellwo");

 // Mycar1 na name of the variable wey go store one car with brand,price and color.

/* MAPPING.
 
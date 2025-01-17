import 'package:flutter/material.dart';


//Listar items con grid
class CoffeePrefs extends StatelessWidget {
  const CoffeePrefs({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;

    // Calcular la cantidad de columnas (por ejemplo, 2 columnas si el ancho es mayor a 600)
    int crossAxisCount = 3;
    if (screenWidth > 600){
      crossAxisCount = 4;
    } else if (screenWidth > 1000){
      crossAxisCount = 5;
    }

    //Lista de widgets
    final List<Widget> itemsGallery = [
      Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/img/girl1.jpg', 
                  width: 100,
                  height: 100,
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.cover,
                ), 
              ) 
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Galllery Waifus", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        ),
        itemCount: itemsGallery.length,
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return itemsGallery[index];
        }
      ),
    );
  }
}


/*//Listar items con grid
class CoffeePrefs extends StatelessWidget {
  const CoffeePrefs({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl1.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl2.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Expanded(
              child: Image.asset(
                'assets/img/girl3.jpg', 
                width: 100,
                height: 100,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
*/

/* //Listar items sin grid
class CoffeePrefs extends StatelessWidget {
  const CoffeePrefs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Waifu 1", style: TextStyle(fontSize: 18),),
            Image.asset(
              'assets/img/girl1.jpg', 
              width: 120,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 2", style: TextStyle(fontSize: 18),),
            Image.asset(
              'assets/img/girl2.jpg', 
              width: 120,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Column(
          children: [
            Text("Waifu 3", style: TextStyle(fontSize: 18),),
            Image.asset(
              'assets/img/girl3.jpg', 
              width: 120,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
*/
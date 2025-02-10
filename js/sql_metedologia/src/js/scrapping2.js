const puppeteer = require('puppeteer');

(
  async () => {
    try{
      //Configuramos el navegador y abrimos una pestaña nueva donde obtendremos la infromacion       
      const browser = await puppeteer.launch({
        headless: true, 
        slowMo: 100,
        browser: 'firefox',
        userDataDir: null
      });
      
      const page = await browser.newPage();
      
      //Obtenemos la pagina y esperamos hasta que se corage el contenido que queremos
      const url = 'https://zonatmo.com';
      await page.goto(url, {timeout: 60000});
      await page.waitForSelector('#pills-populars > .row');
      
      //Leemos la pagina y devolvemos un array con los elementos
      const result = await page.evaluate(() => {
        const titles = Array.from(document.querySelectorAll('#pills-populars > .row > .element .thumbnail-title'));
        const data = titles.map((title) => {
          let text = title.textContent.replaceAll('\n', '').replace(/\s\s+/g, '');//replace(/^[^A-Za-z]+/, '')
          return {"title": text};
        })
        return data;
      });

      console.log(result);

      await page.close();
      await browser.close();
    }catch(err){
      console.error(err);
    }
  }
)();
import { initServer } from "./app";
import * as dotenv from 'dotenv'

dotenv.config()

const port = process.env.PORT || 8000;

async function init() {
  const app = await initServer();
  app.listen(port, () => console.log("server Started...ab to hoja"));
}
init()

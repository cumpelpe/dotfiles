String.prototype.splitCamel = function () { // copies the string and returns camel case split into words
  function isUpperLetter(str) {
    return str.length === 1 && str.match(/[A-Z]/);
  }
  function isLetter(str) {
    return str.length === 1 && str.match(/[a-z]/i);
  }
  let newThis = "";
  let wasLetter = false;
  for (const c of this) {
    if (isUpperLetter(c) && wasLetter) newThis += " ";
    newThis += c;
    wasLetter = isLetter(c);
  }
  return newThis;
};
String.prototype.capitalize = function () {
  return this[0].toUpperCase() + this.slice(1);
};
let now = new Date();
const dateCode = `${now.getFullYear()}${now.getDate()}${now.getMonth()}`;
const dateCodeOffset = function (offset) {
  let now = new Date();
  now.setDate(now.getDate() + offset);
  return `${now.getFullYear()}${now.getDate()}${now.getMonth()}`;
}
const links = [
  { name: "Youtube",  url: "https://www.youtube.com"            },
  { name: "Courses",  url: "https://courses.fit.cvut.cz"        },
  { name: "Fittable", url: "https://timetable.fit.cvut.cz/new/" },
  { name: "Marast",   url: "https://marast.fit.cvut.cz/"        },
  { name: "Progtest", url: "https://progtest.fit.cvut.cz/"      },
];
const DB = new Dexie("quote");
DB.version(2).stores({
  quote: 'date,txt,author,category',
  corona: 'date,cases,todayCases,active,deaths,todayDeaths,recovered,todayRecovered',
});
const getQuote = async () => {
  const now = new Date();
  if (await DB.quote.get(dateCode)) return await DB.quote.get(dateCode);
  console.log("NotInDB");
  const URL = "https://quotes.rest/qod?language=en";
  const data = (await fetch(URL).then((res) => res.json()))["contents"]["quotes"][0];
  const res = {
    txt: data["quote"],
    category: data["category"],
    author: data["author"],
  };
  DB.quote.put({ date: dateCode, ...res });
  return res;
};
let doQuote = async () => {
  const quote = await getQuote();
  document.querySelector("#quote-text").innerText = quote.txt;
  document.querySelector("#quote-author").innerText = quote.author;
};
doQuote();
const timer = document.querySelector("#realtime");
const corona = document.querySelector("#corona");
const linksDiv = document.querySelector("#links");

const interval = window.setInterval(() => {
  const now = new Date();
  timer.innerText = `${now.getDate().toString().padStart(2, "0")}.${
    (now.getMonth() + 1).toString().padStart(2, "0")
    }.${now.getFullYear()} ${now
      .getHours()
      .toString()
      .padStart(2, "0")}:${now.getMinutes().toString().padStart(2, "0")}`;
}, 1000);

const setupLinks = (links, linksDiv) => {
  linksDiv.innerHTML = "";
  for (link of links) {
    const a = document.createElement("a");
    a.href = link.url;
    a.innerText = link.name;
    linksDiv.appendChild(a);
  }
};
setupLinks(links, linksDiv);

const getCoronaData = async (divInto) => {
  class Heading {
    constructor(index, name = "") {
      this._index = index;
      this._name = name;
    }
    get name() {
      if (this._name === "") return this._index;
      return this._name;
    }
    set name(newName) {
      this._name = newName;
    }
    get index() {
      return this._index;
    }
  }

  const URL = "https://corona-stats.online/cz?format=json";

  const data = await fetch(URL).then(data => data.json());
  divInto.innerHTML = "";
  const h = document.createElement("h2");
  const table = document.createElement("table");
  const tr = () => document.createElement("tr");
  const th = () => document.createElement("th");
  const td = () => document.createElement("td");
  let putData = { date: dateCode };
  let yesterdayCorona = await DB.corona.get(dateCodeOffset(-1));
  yesterdayCorona = yesterdayCorona === undefined ? "unknown" : yesterdayCorona;
  for (const i of [
    new Heading("active",         "ActiveCases"     ),
    new Heading("todayCases",     "today ΔCases"    ),
    new Heading("cases",          "TotalCases"      ),
    new Heading("todayDeaths",    "today ΔDeaths"   ),
    new Heading("deaths",         "deathsTotal"     ),
    new Heading("todayRecovered", "today ΔRecovered"),
    new Heading("recovered",      "recoveredTotal"  ),
  ]) {
    const trow = tr();
    table.appendChild(trow);
    let txt;
    if (data["data"][0][i.index] == 0) {
      txt = yesterdayCorona[i.index];
      i.name = i.name.replace(/today/i, 'yesterday');
    }
    else
      txt = data["data"][0][i.index];
    putData[i.index] = data["data"][0][i.index];
    const tdata = td(),
      thead = th();
    tdata.innerText = txt;
    thead.innerText = i.name.capitalize().splitCamel();
    trow.appendChild(thead);
    trow.appendChild(tdata);
    DB.corona.put(putData);
  }
  h.innerText = "Corona tracker";
  divInto.appendChild(h);
  divInto.appendChild(table);
};
getCoronaData(corona);

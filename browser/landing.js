String.prototype.splitCamel = function () {
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
console.log("helloThere".capitalize().splitCamel());

const links = [
  { name: "Youtube", url: "https://www.youtube.com" },
  { name: "Courses", url: "https://courses.fit.cvut.cz" },
];

const getQuote = async () => {
  const URL = "https://quotes.rest/qod?language=en";
  const data = (await fetch(URL).then((res) => res.json()))["contents"][
    "quotes"
  ][0];
  return {
    txt: data["quote"],
    category: data["category"],
    author: data["author"],
  };
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

const interval = setInterval(() => {
  const now = new Date();
  timer.innerText = `${now.getDate().toString().padStart(2, "0")}.${(
    now.getMonth() + 1
  )
    .toString()
    .padStart(
      2,
      "0"
    )}. ${now.getFullYear()}    ${now
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
  class heading {
    constructor(index, name = "") {
      this._index = index;
      this._name = name;
    }
    get name() {
      if (this._name === "") return this._index;
      else return this._name;
    }
    get index() {
      return this._index;
    }
  }

  const URL = "https://corona-stats.online/cz?format=json";

  const data = await fetch(URL).then((data) => data.json());
  console.log(data);
  divInto.innerHTML = "";
  const h = document.createElement("h2");
  const table = document.createElement("table");
  const tr = () => document.createElement("tr");
  const th = () => document.createElement("th");
  const td = () => document.createElement("td");

  for (const i of [
    new heading("active", "ActiveCases"),
    new heading("todayCases", "today ΔCases"),
    new heading("cases", "TotalCases"),
    new heading("todayDeaths", "today ΔDeaths"),
    new heading("deaths", "deathsTotal"),
    new heading("todayRecovered", "today ΔRecovered"),
    new heading("recovered", "recoveredTotal"),
  ]) {
    const trow = tr();
    table.appendChild(trow);
    const txt = data["data"][0][i.index];
    const tdata = td(),
      thead = th();
    tdata.innerText = txt;
    thead.innerText = i.name.capitalize().splitCamel();
    trow.appendChild(thead);
    trow.appendChild(tdata);
  }
  h.innerText = "Corona tracker";
  divInto.appendChild(h);
  divInto.appendChild(table);
};
getCoronaData(corona);

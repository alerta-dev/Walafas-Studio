const canvas = document.getElementById('avatarCanvas');
const ctx = canvas.getContext('2d');

const parts = {
  body: [],
  eyes: [],
  mouth: [],
  hair: [],
  extras: []
};

const positions = {
  body: [0, 0],
  eyes: [0, 0],
  mouth: [0, 0],
  hair: [0, 0],
  extras: [0, 0]
};

const selectors = {
  body: document.getElementById('bodySelect'),
  eyes: document.getElementById('eyesSelect'),
  mouth: document.getElementById('mouthSelect'),
  hair: document.getElementById('hairSelect'),
  extras: document.getElementById('extrasSelect')
};

async function loadImages() {
  for (let part in parts) {
    for (let i = 1; i <= 5; i++) {
      const src = `assets/${part}/${i}.png`;
      const img = new Image();
      img.src = src;
      await new Promise(res => img.onload = res);
      parts[part].push(img);

      const option = document.createElement('option');
      option.value = i - 1;
      option.textContent = `Opción ${i}`;
      selectors[part].appendChild(option);
    }
  }

  drawAvatar();
}

function drawAvatar() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  for (let part in parts) {
    const index = selectors[part].value;
    const img = parts[part][index];
    if (img) {
      const [x, y] = positions[part];
      ctx.drawImage(img, x, y, 500, 500);
    }
  }
}

function exportImage() {
  const link = document.createElement('a');
  link.download = 'avatar.png';
  link.href = canvas.toDataURL('image/png');
  link.click();
}

function toggleDarkMode() {
  document.body.classList.toggle('dark-mode');
}

// Eventos
for (let part in selectors) {
  selectors[part].addEventListener('change', drawAvatar);
}

loadImages();

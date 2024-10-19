# All Bot Airdrop

## Features

- **Claim Farm Reward**: Automatically claim rewards from farming activities.
- **Start Farming Session**: Begin a new farming session.
- **Auto Complete Tasks**: Automatically complete available tasks and claim rewards.
- **Auto Play and Claim Game Points**: Play games and claim game points automatically.
- **Claim Daily Reward**: Automatically claim daily rewards.

## Flows

### Default Flow

The **Default Flow** allows users to manually select specific tasks to perform. You can choose from:

1. **Claim Farm Reward**: Automatically claim farm rewards.
2. **Start Farming Session**: Begin a new farming session.
3. **Auto Complete Tasks**: Complete and claim rewards for available tasks.
4. **Auto Play and Claim Game Points**: Play games and claim game points.
5. **Claim Daily Reward**: Claim your daily reward.

After performing an action, you can choose to set up a cron job for regular automation or exit the bot if no automation is needed.

### One-time Flow

The **One-time Flow** runs a continuous sequence of tasks without manual intervention. This flow includes:

1. **Claim Farm Reward**: Claim the farm reward.
2. **Claim Daily Reward**: Claim the daily reward.
3. **Claim Game Points**: Play games and claim game points.
4. **Start Farming Session**: Begin a new farming session.

The One-time Flow will continuously execute these tasks, handling errors gracefully and attempting to restart after a specified delay (e.g., 12 hours) if issues arise.

## Setup

### Prerequisites

- [Node.js](https://nodejs.org/) (version 14 or later)
- [npm](https://www.npmjs.com/) (comes with Node.js)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/DhavidFebrian/bot
    ```

2. **Navigate to the project directory:**

    ```bash
    cd bot
    ```

3. **Install dependencies:**

    ```bash
    pkg update && pkg upgrade
    pkg install python
    pkg install git
    pkg install nodejs
    npm install
    ```

### Configuration for blum

1. **Create a `.env` file** in the root directory of the project.

2. **Add your `SESSION_KEY` to the `.env` file**. Example format:

    ```env
    SESSION_KEY=YOUR_QUERY_ID_VALUE_HERE
    ```

   - To find your `SESSION_KEY`, follow these steps:
     1. Open [Web Telegram](https://web.telegram.org) in your browser.
     2. Open the [Blum Bot](https://t.me/BlumCryptoBot/app?startapp=ref_vTHusRz4j0).
     3. Open DevTools (right-click on the page and select "Inspect" or press `F12`).
     4. Go to the "Application" tab, then "Local Storage", and choose `https://telegram.blum.codes`.
     5. Find `QUERY_ID`, copy its value.

   - **Connection Issues?** If you can't open the Blum bot, you may need to use the following Chrome extension to bypass connection restrictions: [Ignore X-Frame-Headers](https://chromewebstore.google.com/detail/ignore-x-frame-headers/gleekbfjekiniecknbkamfmkohkpodhe).

## Running the Bot

To start the bot and choose a flow:

1. **Start the bot:**

    ```bash
    ./run2.sh
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

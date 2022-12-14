//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     TickerFull data = nlohmann::json::parse(jsonString);

#pragma once

#include "json.hpp"

#include <boost/optional.hpp>
#include <stdexcept>
#include <regex>

#ifndef NLOHMANN_OPT_HELPER
#define NLOHMANN_OPT_HELPER
namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::shared_ptr<T>> {
        static void to_json(json & j, const std::shared_ptr<T> & opt) {
            if (!opt) j = nullptr; else j = *opt;
        }

        static std::shared_ptr<T> from_json(const json & j) {
            if (j.is_null()) return std::unique_ptr<T>(); else return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };
}
#endif

namespace TickerFull {
    using nlohmann::json;

    inline json get_untyped(const json & j, const char * property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }

    inline json get_untyped(const json & j, std::string property) {
        return get_untyped(j, property.data());
    }

    template <typename T>
    inline std::shared_ptr<T> get_optional(const json & j, const char * property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<std::shared_ptr<T>>();
        }
        return std::shared_ptr<T>();
    }

    template <typename T>
    inline std::shared_ptr<T> get_optional(const json & j, std::string property) {
        return get_optional<T>(j, property.data());
    }

    class Buy {
        public:
        Buy() = default;
        virtual ~Buy() = default;

        private:
        std::shared_ptr<int64_t> orders;
        std::shared_ptr<double> price;
        std::shared_ptr<int64_t> quantity;

        public:
        std::shared_ptr<int64_t> get_orders() const { return orders; }
        void set_orders(std::shared_ptr<int64_t> value) { this->orders = value; }

        std::shared_ptr<double> get_price() const { return price; }
        void set_price(std::shared_ptr<double> value) { this->price = value; }

        std::shared_ptr<int64_t> get_quantity() const { return quantity; }
        void set_quantity(std::shared_ptr<int64_t> value) { this->quantity = value; }
    };

    class Depth {
        public:
        Depth() = default;
        virtual ~Depth() = default;

        private:
        std::shared_ptr<std::vector<Buy>> buy;
        std::shared_ptr<std::vector<Buy>> sell;

        public:
        std::shared_ptr<std::vector<Buy>> get_buy() const { return buy; }
        void set_buy(std::shared_ptr<std::vector<Buy>> value) { this->buy = value; }

        std::shared_ptr<std::vector<Buy>> get_sell() const { return sell; }
        void set_sell(std::shared_ptr<std::vector<Buy>> value) { this->sell = value; }
    };

    class Ohlc {
        public:
        Ohlc() = default;
        virtual ~Ohlc() = default;

        private:
        std::shared_ptr<double> close;
        std::shared_ptr<int64_t> high;
        std::shared_ptr<double> low;
        std::shared_ptr<double> open;

        public:
        std::shared_ptr<double> get_close() const { return close; }
        void set_close(std::shared_ptr<double> value) { this->close = value; }

        std::shared_ptr<int64_t> get_high() const { return high; }
        void set_high(std::shared_ptr<int64_t> value) { this->high = value; }

        std::shared_ptr<double> get_low() const { return low; }
        void set_low(std::shared_ptr<double> value) { this->low = value; }

        std::shared_ptr<double> get_open() const { return open; }
        void set_open(std::shared_ptr<double> value) { this->open = value; }
    };

    class TickerFull {
        public:
        TickerFull() = default;
        virtual ~TickerFull() = default;

        private:
        std::shared_ptr<double> average_price;
        std::shared_ptr<int64_t> buy_quantity;
        std::shared_ptr<double> change;
        std::shared_ptr<Depth> depth;
        std::shared_ptr<int64_t> instrument_token;
        std::shared_ptr<double> last_price;
        std::shared_ptr<int64_t> last_quantity;
        std::shared_ptr<std::string> last_trade_time;
        std::shared_ptr<std::string> mode;
        std::shared_ptr<Ohlc> ohlc;
        std::shared_ptr<int64_t> oi;
        std::shared_ptr<int64_t> oi_day_high;
        std::shared_ptr<int64_t> oi_day_low;
        std::shared_ptr<int64_t> sell_quantity;
        std::shared_ptr<std::string> timestamp;
        std::shared_ptr<bool> tradable;
        std::shared_ptr<int64_t> volume;

        public:
        std::shared_ptr<double> get_average_price() const { return average_price; }
        void set_average_price(std::shared_ptr<double> value) { this->average_price = value; }

        std::shared_ptr<int64_t> get_buy_quantity() const { return buy_quantity; }
        void set_buy_quantity(std::shared_ptr<int64_t> value) { this->buy_quantity = value; }

        std::shared_ptr<double> get_change() const { return change; }
        void set_change(std::shared_ptr<double> value) { this->change = value; }

        std::shared_ptr<Depth> get_depth() const { return depth; }
        void set_depth(std::shared_ptr<Depth> value) { this->depth = value; }

        std::shared_ptr<int64_t> get_instrument_token() const { return instrument_token; }
        void set_instrument_token(std::shared_ptr<int64_t> value) { this->instrument_token = value; }

        std::shared_ptr<double> get_last_price() const { return last_price; }
        void set_last_price(std::shared_ptr<double> value) { this->last_price = value; }

        std::shared_ptr<int64_t> get_last_quantity() const { return last_quantity; }
        void set_last_quantity(std::shared_ptr<int64_t> value) { this->last_quantity = value; }

        std::shared_ptr<std::string> get_last_trade_time() const { return last_trade_time; }
        void set_last_trade_time(std::shared_ptr<std::string> value) { this->last_trade_time = value; }

        std::shared_ptr<std::string> get_mode() const { return mode; }
        void set_mode(std::shared_ptr<std::string> value) { this->mode = value; }

        std::shared_ptr<Ohlc> get_ohlc() const { return ohlc; }
        void set_ohlc(std::shared_ptr<Ohlc> value) { this->ohlc = value; }

        std::shared_ptr<int64_t> get_oi() const { return oi; }
        void set_oi(std::shared_ptr<int64_t> value) { this->oi = value; }

        std::shared_ptr<int64_t> get_oi_day_high() const { return oi_day_high; }
        void set_oi_day_high(std::shared_ptr<int64_t> value) { this->oi_day_high = value; }

        std::shared_ptr<int64_t> get_oi_day_low() const { return oi_day_low; }
        void set_oi_day_low(std::shared_ptr<int64_t> value) { this->oi_day_low = value; }

        std::shared_ptr<int64_t> get_sell_quantity() const { return sell_quantity; }
        void set_sell_quantity(std::shared_ptr<int64_t> value) { this->sell_quantity = value; }

        std::shared_ptr<std::string> get_timestamp() const { return timestamp; }
        void set_timestamp(std::shared_ptr<std::string> value) { this->timestamp = value; }

        std::shared_ptr<bool> get_tradable() const { return tradable; }
        void set_tradable(std::shared_ptr<bool> value) { this->tradable = value; }

        std::shared_ptr<int64_t> get_volume() const { return volume; }
        void set_volume(std::shared_ptr<int64_t> value) { this->volume = value; }
    };
}

namespace nlohmann {
    void from_json(const json & j, TickerFull::Buy & x);
    void to_json(json & j, const TickerFull::Buy & x);

    void from_json(const json & j, TickerFull::Depth & x);
    void to_json(json & j, const TickerFull::Depth & x);

    void from_json(const json & j, TickerFull::Ohlc & x);
    void to_json(json & j, const TickerFull::Ohlc & x);

    void from_json(const json & j, TickerFull::TickerFull & x);
    void to_json(json & j, const TickerFull::TickerFull & x);

    inline void from_json(const json & j, TickerFull::Buy& x) {
        x.set_orders(TickerFull::get_optional<int64_t>(j, "orders"));
        x.set_price(TickerFull::get_optional<double>(j, "price"));
        x.set_quantity(TickerFull::get_optional<int64_t>(j, "quantity"));
    }

    inline void to_json(json & j, const TickerFull::Buy & x) {
        j = json::object();
        j["orders"] = x.get_orders();
        j["price"] = x.get_price();
        j["quantity"] = x.get_quantity();
    }

    inline void from_json(const json & j, TickerFull::Depth& x) {
        x.set_buy(TickerFull::get_optional<std::vector<TickerFull::Buy>>(j, "buy"));
        x.set_sell(TickerFull::get_optional<std::vector<TickerFull::Buy>>(j, "sell"));
    }

    inline void to_json(json & j, const TickerFull::Depth & x) {
        j = json::object();
        j["buy"] = x.get_buy();
        j["sell"] = x.get_sell();
    }

    inline void from_json(const json & j, TickerFull::Ohlc& x) {
        x.set_close(TickerFull::get_optional<double>(j, "close"));
        x.set_high(TickerFull::get_optional<int64_t>(j, "high"));
        x.set_low(TickerFull::get_optional<double>(j, "low"));
        x.set_open(TickerFull::get_optional<double>(j, "open"));
    }

    inline void to_json(json & j, const TickerFull::Ohlc & x) {
        j = json::object();
        j["close"] = x.get_close();
        j["high"] = x.get_high();
        j["low"] = x.get_low();
        j["open"] = x.get_open();
    }

    inline void from_json(const json & j, TickerFull::TickerFull& x) {
        x.set_average_price(TickerFull::get_optional<double>(j, "average_price"));
        x.set_buy_quantity(TickerFull::get_optional<int64_t>(j, "buy_quantity"));
        x.set_change(TickerFull::get_optional<double>(j, "change"));
        x.set_depth(TickerFull::get_optional<TickerFull::Depth>(j, "depth"));
        x.set_instrument_token(TickerFull::get_optional<int64_t>(j, "instrument_token"));
        x.set_last_price(TickerFull::get_optional<double>(j, "last_price"));
        x.set_last_quantity(TickerFull::get_optional<int64_t>(j, "last_quantity"));
        x.set_last_trade_time(TickerFull::get_optional<std::string>(j, "last_trade_time"));
        x.set_mode(TickerFull::get_optional<std::string>(j, "mode"));
        x.set_ohlc(TickerFull::get_optional<TickerFull::Ohlc>(j, "ohlc"));
        x.set_oi(TickerFull::get_optional<int64_t>(j, "oi"));
        x.set_oi_day_high(TickerFull::get_optional<int64_t>(j, "oi_day_high"));
        x.set_oi_day_low(TickerFull::get_optional<int64_t>(j, "oi_day_low"));
        x.set_sell_quantity(TickerFull::get_optional<int64_t>(j, "sell_quantity"));
        x.set_timestamp(TickerFull::get_optional<std::string>(j, "timestamp"));
        x.set_tradable(TickerFull::get_optional<bool>(j, "tradable"));
        x.set_volume(TickerFull::get_optional<int64_t>(j, "volume"));
    }

    inline void to_json(json & j, const TickerFull::TickerFull & x) {
        j = json::object();
        j["average_price"] = x.get_average_price();
        j["buy_quantity"] = x.get_buy_quantity();
        j["change"] = x.get_change();
        j["depth"] = x.get_depth();
        j["instrument_token"] = x.get_instrument_token();
        j["last_price"] = x.get_last_price();
        j["last_quantity"] = x.get_last_quantity();
        j["last_trade_time"] = x.get_last_trade_time();
        j["mode"] = x.get_mode();
        j["ohlc"] = x.get_ohlc();
        j["oi"] = x.get_oi();
        j["oi_day_high"] = x.get_oi_day_high();
        j["oi_day_low"] = x.get_oi_day_low();
        j["sell_quantity"] = x.get_sell_quantity();
        j["timestamp"] = x.get_timestamp();
        j["tradable"] = x.get_tradable();
        j["volume"] = x.get_volume();
    }
}
